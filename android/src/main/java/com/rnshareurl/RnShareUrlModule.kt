package com.rnshareurl
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule
import android.content.Intent

@ReactModule(name = RnShareUrlModule.NAME)
class RnShareUrlModule(reactContext: ReactApplicationContext) :
  NativeRnShareUrlSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  override fun shareUrl(url:String) {
    val sendIntent = Intent().apply {
      action = Intent.ACTION_SEND
      putExtra(Intent.EXTRA_TEXT, url)
      type = "text/plain"
    }
    
    val shareIntent = Intent.createChooser(sendIntent, null)
    shareIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    
    reactApplicationContext.startActivity(shareIntent)
    
  }

  companion object {
    const val NAME = "RnShareUrl"
  }
}
