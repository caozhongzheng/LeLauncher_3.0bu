package com.lenovo.launcher2.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;

import com.lenovo.launcher.R;
import com.lenovo.launcher.components.XAllAppFace.XLauncherModel;
import com.lenovo.launcher2.customizer.SettingsValue;

public class ThemeShortCut extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // shortcut intent
        Intent shortcutIntent = new Intent(SettingsValue.ACTION_LETHEME_LAUNCH);
        shortcutIntent.putExtra("EXTRA",12);
        shortcutIntent.setPackage(SettingsValue.LAUNCHER_PACKAGE_NAME_PREF);
        shortcutIntent.putExtra(XLauncherModel.EXTRA_SHORTCUT_LABEL_RESOURCE, R.string.wallpaper_settings_title);
        shortcutIntent.putExtra(XLauncherModel.EXTRA_SHORTCUT_LABEL_RESNAME,
                this.getResources().getResourceName(R.string.wallpaper_settings_title));

        // set theme info
//        shortcutIntent.setClassName(this, ThemeSettings.class.getName());

        // set name
        Intent intent = new Intent();
        intent.putExtra(Intent.EXTRA_SHORTCUT_INTENT, shortcutIntent);
        intent.putExtra(Intent.EXTRA_SHORTCUT_NAME, getString(R.string.wallpaper_settings_title));

        // set icon
        Parcelable iconResource = Intent.ShortcutIconResource.fromContext(this,
                R.drawable.ic_launcher_theme_shortcut);
        intent.putExtra(Intent.EXTRA_SHORTCUT_ICON_RESOURCE, iconResource);

        // // Now, return the result to the launcher
        setResult(RESULT_OK, intent);
        finish();
    }
}
