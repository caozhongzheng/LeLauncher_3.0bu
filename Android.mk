#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

#modify by zhangdxa 20120229
LOCAL_STATIC_JAVA_LIBRARIES := android-common android-support-v13 suslib reaperlib feedback feedbackAgent http lsfcom lcp lsfdispatch weibo lsfuser 

LOCAL_SRC_FILES := $(call all-java-files-under, src) $(call all-renderscript-files-under, src)

LOCAL_SRC_FILES += \
        src/com/lenovo/lejingpin/share/download/IDownloadService.aidl

LOCAL_PACKAGE_NAME := MagicLauncher
#cancel by xingqx 2012.02.22
#LOCAL_CERTIFICATE := shared

LOCAL_OVERRIDES_PACKAGES := Home

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

include $(BUILD_PACKAGE)

#modify by zhangdxa 20120229
include $(CLEAR_VARS)
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := suslib:libs/sus.jar 
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += reaperlib:libs/lenovo-analytics-sdk-2.3.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += feedback:libs/DiscuzAdvisetoGo.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += feedbackAgent:libs/FeedbackAgent_v2.0.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += http:libs/httpmime-4.1.2.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += lsfcom:libs/lsf-common.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += lcp:libs/lcp.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += lsfdispatch:libs/lsf-dispatch.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += weibo:libs/weibo.sdk.android.sso.jar
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES += lsfuser:libs/Lsf-user-4.1.1.jar
include $(BUILD_MULTI_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
