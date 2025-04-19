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
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.UserHandle;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.widget.Toast;
import androidx.preference.PreferenceManager;
import org.lineageos.settings.R;

public class TurboChargingTile extends TileService {

    private static final String PREF_TURBO_ENABLED = "turbo_enable";

    @Override
    public void onClick() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        boolean turboEnabled = prefs.getBoolean(PREF_TURBO_ENABLED, false);
        boolean newState = !turboEnabled;
        prefs.edit().putBoolean(PREF_TURBO_ENABLED, newState).apply();
        TurboChargingUtil.applyTurboSetting(this);
        Toast.makeText(this, newState ? getString(R.string.toast_turbo_on) : getString(R.string.toast_turbo_off),
                Toast.LENGTH_SHORT).show();
        Tile tile = getQsTile();
        if (tile != null) {
            tile.setState(newState ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
            tile.updateTile();
        }
    }
}
