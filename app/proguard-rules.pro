# Glide图片库的混淆处理
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
    **[] $VALUES;
    public *;
}

#-optimizationpasses 5
#-dontusemixedcaseclassnames
#-dontskipnonpubliclibraryclasses
#-dontpreverify
#-verbose
#-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# 指定压缩级别
-optimizationpasses 5
# 不跳过非公共的库的类成员
-dontskipnonpubliclibraryclassmembers
# 混淆时采用的算法(google推荐，一般不改变)
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
# 把混淆类中的方法名也混淆了
-useuniqueclassmembernames
# 优化时允许访问并修改有修饰符的类和类的成员
-allowaccessmodification
# 不做预检验,preverify是proguard的四个步骤之一,Android不需要preverify,去掉这一步可以加快混淆速度
-dontpreverify
# 将文件来源重命名为“SourceFile”字符串
-renamesourcefileattribute SourceFile
# 保留行号
-keepattributes SourceFile,LineNumberTable



# 高德地图混淆脚本
-keep class com.Android.support.**{ *; }
-keep interface Android.support.v4.app.**{ *; }
-keep public class * extends Android.support.v4.**
-keep public class * extends Android.app.Fragment

-dontwarn com.amap.api.**
-dontwarn com.a.a.**
-dontwarn com.autonavi.**
-keep class com.amap.api.** {*;}
-keep class com.autonavi.** {*;}
-keep class com.a.a.** {*;}



# Gson混淆脚本
-keep class com.google.gson.stream.** {*;}
-keep class com.youyou.uuelectric.renter.Network.user.** {*;}



# butterknife混淆脚本
-dontwarn butterknife.internal.**
-keep class **$$ViewInjector { *; }
-keepnames class * { @butterknife.InjectView *;}

# -------------系统类不需要混淆 --------------------------
-keep public class * extends Android.app.Fragment
-keep public class * extends Android.app.Activity
-keep public class * extends Android.app.Application
-keep public class * extends Android.app.Service
-keep public class * extends Android.content.BroadcastReceiver
-keep public class * extends Android.content.ContentProvider
-keep public class * extends Android.app.backup.BackupAgentHelper
-keep public class * extends Android.preference.Preference
-keep public class * extends Android.support.**
-keep public class com.Android.vending.licensing.ILicensingService

-keepclasseswithmembernames class * { # 保持native方法不被混淆
    native <methods>;
}
-keepclasseswithmembernames class * { # 保持自定义控件不被混淆
    public <init>(Android.content.Context, Android.util.AttributeSet);
}
-keepclasseswithmembernames class * { # 保持自定义控件不被混淆
    public <init>(Android.content.Context, Android.util.AttributeSet, int);
}
-keepclassmembers enum * { # 保持枚举enum类不被混淆
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep class * implements Android.os.Parcelable { # 保持Parcelable不被混淆
  public static final Android.os.Parcelable$Creator *;
}

# --------- 忽略异常提示 --------------------
-dontwarn butterknife.internal.**
-dontwarn com.alipay.**
-dontwarn com.mikepenz.**
-dontwarn org.apache.**
-dontwarn com.amap.**
-dontwarn com.Android.volley.**
-dontwarn com.rey.**
-dontwarn com.testin.**
-dontwarn jp.wasabeef.**

# ---------- 保持代码 --------------
-keep class com.youyou.uuelectric.renter.Utils.** {*;}
-keep class it.neokree.** {*;}
-keep class org.apache.** {*;}
-keep class com.iflytek.** {*;}
-keep class com.google.protobuf.** { *; }
-keep class com.youyou.uuelectric.renter.pay.** {*;}
-keep class com.ksy.recordlib.** { *;}
# ---------------- eventbus避免混淆 ------------
-keepclassmembers class ** {
    public void onEvent*(**);
    void onEvent*(**);
}


# --------------- 友盟统计避免混淆 -------------------------
-dontwarn Android.support.v4.**
-dontwarn org.apache.commons.net.**
-dontwarn com.tencent.**
-keepclasseswithmembernames class * {
    native <methods>;
}
-keepclasseswithmembernames class * {
    public <init>(Android.content.Context, Android.util.AttributeSet);
}
-keepclasseswithmembernames class * {
    public <init>(Android.content.Context, Android.util.AttributeSet, int);
}
-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep class * implements Android.os.Parcelable {
  public static final Android.os.Parcelable$Creator *;
}
-keepclasseswithmembers class * {
    public <init>(Android.content.Context);
}
-dontshrink
-dontoptimize
-dontwarn com.google.Android.maps.**
-dontwarn Android.webkit.WebView
-dontwarn com.umeng.**
-dontwarn com.tencent.weibo.sdk.**
-dontwarn com.facebook.**
-keep enum com.facebook.**
-keepattributes Exceptions,InnerClasses,Signature
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public interface com.facebook.**
-keep public interface com.tencent.**
-keep public interface com.umeng.socialize.**
-keep public interface com.umeng.socialize.sensor.**
-keep public interface com.umeng.scrshot.**
-keep public class com.umeng.socialize.* {*;}
-keep public class javax.**
-keep public class Android.webkit.**
-keep class com.facebook.**
-keep class com.umeng.scrshot.**
-keep public class com.tencent.** {*;}
-keep class com.umeng.socialize.sensor.**
-keep class com.tencent.mm.sdk.openapi.WXMediaMessage {*;}
-keep class com.tencent.mm.sdk.openapi.** implements com.tencent.mm.sdk.openapi.WXMediaMessage$IMediaObject {*;}
-keep class im.yixin.sdk.api.YXMessage {*;}
-keep class im.yixin.sdk.api.** implements im.yixin.sdk.api.YXMessage$YXMessageData{*;}
-keep public class [your_pkg].R$*{
    public static final int *;
}

# 热修复混淆
-keep class * extends java.lang.annotation.Annotation
-keep class com.alipay.euler.andfix.** { *; }
-keepclasseswithmembernames class * {
    native <methods>;
}

-keep class  tv.sisi.live.customviews.ZanView{ *; }
-keep class  tv.sisi.live.customviews.ZanBean{ *; }

-dontwarn com.**
-dontwarn java.**
-dontwarn org.**

# KsyMediaPlayer
-keep class com.ksyun.** {
  *;
}
-keep class com.ksy.statlibrary.** {
  *;
}
-keep class io.agora.** {
  *;
}


##---------------Begin: proguard configuration for fastjson  ----------

-keepnames  public class * implements java.io.Serializable
-keep public class * implements java.io.Serializable {
        public *;
}


-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
-dontwarn android.support.**
-dontwarn com.alibaba.fastjson.**
# 避免混淆泛型
# FastJson
-dontwarn com.alibaba.fastjson.**
-keep class com.alibaba.fastjson.** { *; }

-keepattributes *Annotation*

-dontskipnonpubliclibraryclassmembers
-dontskipnonpubliclibraryclasses
-keep class com.alibaba.fastjson.** { *; }

-keepclassmembers class * {
public <methods>;
}

-keepclassmembers class * {
    public <methods>;
}
##---------------End: proguard configuration for fastjson  ----------


##-----bugly---------

-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}

-dontoptimize
-dontpreverify

-dontwarn cn.jpush.**
-keep class cn.jpush.** { *; }
-keep class * extends cn.jpush.android.helpers.JPushMessageReceiver { *; }

-dontwarn cn.jiguang.**
-keep class cn.jiguang.** { *; }
-dontwarn com.google.**
-keep class com.google.gson.** {*;}
-keep class com.google.protobuf.** {*;}
#okhttp
-dontwarn okhttp3.**
-keep class okhttp3.**{*;}

#okio
-dontwarn okio.**
-keep class okio.**{*;}


# Gson
-keep class com.google.**{*;}

-keepattributes Signature
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }
# 使用Gson时需要配置Gson的解析对象及变量都不混淆。不然Gson会找不到变量。
# 将下面替换成自己的实体类
-keep class com.deerlive.zhuawawa.model.** { *; }


-keep public class pl.droidsonroids.gif.GifIOException{<init>(int);}
-keep class pl.droidsonroids.gif.GifInfoHandle{<init>(long,int,int,int);}

-keep class com.chad.library.adapter.** {
*;
}
-keep public class * extends com.chad.library.adapter.base.BaseQuickAdapter
-keep public class * extends com.chad.library.adapter.base.BaseViewHolder
-keepclassmembers  class **$** extends com.chad.library.adapter.base.BaseViewHolder {
     <init>(...);
}

-keep,allowobfuscation @interface com.facebook.common.internal.DoNotStrip

# Do not strip any method/class that is annotated with @DoNotStrip
-keep @com.facebook.common.internal.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.common.internal.DoNotStrip *;
}
