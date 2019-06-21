package com.drzaln.bakul;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
//    if (android.os.Build.VERSION.SDK_INT >= 21) {
//      getWindow().setStatusBarColor(0x00000000);
//    }
  }
}
