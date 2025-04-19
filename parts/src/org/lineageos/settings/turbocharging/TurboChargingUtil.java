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

import android.content.Context;
import android.content.SharedPreferences;
import androidx.preference.PreferenceManager;
import java.lang.reflect.Method;

public class TurboChargingUtil {

    private static final String PREF_TURBO_ENABLED = "turbo_enable";
    private static final String PREF_TURBO_CURRENT = "turbo_current";
    private static final String PROP_TURBO_CURRENT = "persist.sys.turbo_charge_current";
    private static final String DEFAULT_OFF_VALUE = "6000000";
    private static final String DEFAULT_ON_VALUE = "9750000";

    public static void applyTurboSetting(Context context) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        boolean turboEnabled = prefs.getBoolean(PREF_TURBO_ENABLED, false);
        String turboValue = turboEnabled ? prefs.getString(PREF_TURBO_CURRENT, DEFAULT_ON_VALUE)
                : DEFAULT_OFF_VALUE;

        try {
            Class<?> sp = Class.forName("android.os.SystemProperties");
            Method setProp = sp.getMethod("set", String.class, String.class);
            setProp.invoke(null, PROP_TURBO_CURRENT, turboValue);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
