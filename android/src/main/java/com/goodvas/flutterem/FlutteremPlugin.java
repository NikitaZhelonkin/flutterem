package com.goodvas.flutterem;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import java.util.HashMap;
import java.util.Map;
import android.util.Log;
import 	android.util.DisplayMetrics;

import android.graphics.Point;
import android.view.WindowManager;

/** FlutteremPlugin */
public class FlutteremPlugin implements MethodCallHandler {
  /** Plugin registration. */

  static DisplayMetrics metrics= new DisplayMetrics();

  public static void registerWith(Registrar registrar) {
    
    WindowManager wm = registrar.activity().getWindowManager();
    
    wm.getDefaultDisplay().getMetrics(metrics);
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutterem");
    channel.setMethodCallHandler(new FlutteremPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getDisplaySize")) {
      Map<String, Double> data = new HashMap<String, Double>();
      data.put("width", (double)(metrics.widthPixels/metrics.density));
      data.put("height", (double)(metrics.heightPixels/metrics.density));
      result.success(data);
    } else {
      result.notImplemented();
    }
  }
}
