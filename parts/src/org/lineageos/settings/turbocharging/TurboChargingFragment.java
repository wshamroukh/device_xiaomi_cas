/*
 * Copyright (C) 2025 kenway214
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.turbocharging;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceManager;
import androidx.preference.SwitchPreferenceCompat;
import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity;
import com.android.settingslib.widget.MainSwitchPreference;
import org.lineageos.settings.R;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;

public class TurboChargingFragment extends PreferenceFragment implements Preference.OnPreferenceChangeListener {

    private static final String TAG = "TurboChargingFragment";

    private static final String PROP_TURBO_CURRENT = "persist.sys.turbo_charge_current";
    private static final String DEFAULT_OFF_VALUE = "6000000";
    private static final String DEFAULT_ON_VALUE = "9750000";

    private static final String PREF_TURBO_ENABLED = "turbo_enable";
    private static final String PREF_SPORTS_MODE = "sports_mode";
    private static final String PREF_TURBO_CURRENT = "turbo_current";

    private static final String SPORTS_MODE_NODE = "/sys/class/qcom-battery/restrict_chg";

    private MainSwitchPreference mTurboEnabled;
    private SwitchPreferenceCompat mSportsMode;
    private ListPreference mTurboCurrent;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        setPreferencesFromResource(R.xml.turbocharging, rootKey);

        mTurboEnabled = (MainSwitchPreference) findPreference(PREF_TURBO_ENABLED);
        mTurboEnabled.setOnPreferenceChangeListener(this);

        mSportsMode = (SwitchPreferenceCompat) findPreference(PREF_SPORTS_MODE);
        mSportsMode.setOnPreferenceChangeListener(this);
        
        mSportsMode.setEnabled(mTurboEnabled.isChecked());

        mTurboCurrent = (ListPreference) findPreference(PREF_TURBO_CURRENT);
        mTurboCurrent.setOnPreferenceChangeListener(this);
        mTurboCurrent.setEnabled(mTurboEnabled.isChecked());
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (preference == mTurboEnabled) {
            boolean turboEnabled = (boolean) newValue;
            mTurboCurrent.setEnabled(turboEnabled);
            mSportsMode.setEnabled(turboEnabled);
            
            updateChargeCurrent();
            Toast.makeText(getActivity(), turboEnabled ? 
                getString(R.string.toast_turbo_on) : getString(R.string.toast_turbo_off),
                Toast.LENGTH_SHORT).show();
            return true;
        } else if (preference == mSportsMode) {
            boolean sportsEnabled = (boolean) newValue;
            updateSportsMode(sportsEnabled);
            Toast.makeText(getActivity(), sportsEnabled ? 
                getString(R.string.toast_sports_on) : getString(R.string.toast_sports_off),
                Toast.LENGTH_SHORT).show();
            return true;
        } else if (preference == mTurboCurrent) {
            String value = (String) newValue;
            PreferenceManager.getDefaultSharedPreferences(getActivity())
                    .edit()
                    .putString(PREF_TURBO_CURRENT, value)
                    .apply();
            updateChargeCurrent();
            Toast.makeText(getActivity(), String.format(getString(R.string.toast_wattage_set), value),
                    Toast.LENGTH_SHORT).show();
            return true;
        }
        return false;
    }

    private void updateChargeCurrent() {
        boolean turboEnabled = PreferenceManager.getDefaultSharedPreferences(getActivity())
                .getBoolean(PREF_TURBO_ENABLED, false);
        String valueToSet = turboEnabled ? PreferenceManager.getDefaultSharedPreferences(getActivity())
                .getString(PREF_TURBO_CURRENT, DEFAULT_ON_VALUE) : DEFAULT_OFF_VALUE;
        Log.i(TAG, "Setting System property " + PROP_TURBO_CURRENT + " to: " + valueToSet);
        setChargingProperty(valueToSet);
    }

    private void setChargingProperty(String value) {
        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            Method setProp = sp.getMethod("set", String.class, String.class);
            setProp.invoke(null, PROP_TURBO_CURRENT, value);
            Log.i(TAG, "System property " + PROP_TURBO_CURRENT + " set to " + value);
        } catch (Exception e) {
            Log.e(TAG, "Failed to set property " + PROP_TURBO_CURRENT, e);
        }
    }

    private void updateSportsMode(boolean enabled) {
        String value = enabled ? "1" : "0";
        Log.i(TAG, "Updating Sports Mode node " + SPORTS_MODE_NODE + " to: " + value);
        writeSportsMode(value);
    }

    private void writeSportsMode(String value) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(SPORTS_MODE_NODE))) {
            writer.write(value);
            Log.i(TAG, "Sports Mode node updated to " + value);
        } catch (IOException e) {
            Log.e(TAG, "Failed to update Sports Mode node", e);
        }
    }
}
