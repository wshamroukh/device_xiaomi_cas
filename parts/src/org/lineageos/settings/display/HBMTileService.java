/*
* Copyright (C) 2018 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.lineageos.settings.display;

import android.annotation.TargetApi;
import android.content.Intent;
import android.content.SharedPreferences;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import androidx.preference.PreferenceManager;
import android.provider.Settings;

import org.lineageos.settings.display.DisplayNodes;
import org.lineageos.settings.utils.FileUtils;

public class HBMTileService extends TileService {

    private String HBM_ENABLE_KEY;
    private String HBM_NODE;
    private String BACKLIGHT_NODE;

    private void updateUI(boolean enabled) {
        final Tile tile = getQsTile();
        tile.setState(enabled ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
        tile.updateTile();
    }

    @Override
    public void onStartListening() {
        super.onStartListening();
        HBM_ENABLE_KEY = DisplayNodes.getHbmEnableKey();
        HBM_NODE = DisplayNodes.getHbmNode();
        BACKLIGHT_NODE = DisplayNodes.getBacklight();
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(this);
        updateUI(sharedPrefs.getBoolean(HBM_ENABLE_KEY, false));
    }

    @Override
    public void onStopListening() {
        super.onStopListening();
    }

    @Override
    public void onClick() {
        super.onClick();
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(this);
        final boolean enabled = !(sharedPrefs.getBoolean(HBM_ENABLE_KEY, false));
        FileUtils.writeLine(HBM_NODE, enabled ? "1" : "0");
        sharedPrefs.edit().putBoolean(HBM_ENABLE_KEY, enabled).commit();
        if (enabled) {
            // Set the backlight to its maximum value
            FileUtils.writeLine(BACKLIGHT_NODE, "2047");
            // Update the system's screen brightness to maximum
            Settings.System.putInt(this.getContentResolver(), Settings.System.SCREEN_BRIGHTNESS, 255);
        }
        updateUI(enabled);
    }
}
