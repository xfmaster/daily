package com.daily.daily_app;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }
}
