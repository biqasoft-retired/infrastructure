FROM biqasoft/teamcity-agent-base

# based on https://github.com/JetBrains/teamcity-docker-minimal-agent

ENV ANDROID_COMPILE_SDK=25

# https://developer.android.com/studio/releases/build-tools.html
ENV ANDROID_BUILD_TOOLS=25.0.2

# https://developer.android.com/studio/releases/sdk-tools.html
ENV ANDROID_SDK_TOOLS=25.2.3

ENV ANDROID_HOME=/android
# download android sdk
# install all sdk packages

RUN wget https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip && unzip ghr_v0.5.4_linux_amd64.zip && cp ghr /bin && chmod +x /bin/ghr && wget https://github.com/patrickfav/uber-apk-signer/releases/download/v0.7.0/uber-apk-signer-0.7.0.jar && cp uber-apk-signer-0.7.0.jar /bin

RUN mkdir /android && cd android && apt-get update && apt-get install -y wget tar unzip zsh lib32stdc++6 lib32z1 curl jq && \
	wget https://dl.google.com/android/repository/tools_r${ANDROID_SDK_TOOLS}-linux.zip && \
	unzip tools_r${ANDROID_SDK_TOOLS}-linux.zip && rm tools_r${ANDROID_SDK_TOOLS}-linux.zip && \ 
	cd tools/bin && \ 
	yes | ./sdkmanager "platform-tools" "build-tools;$ANDROID_BUILD_TOOLS" "platforms;android-$ANDROID_COMPILE_SDK" "extras;android;m2repository" "extras;google;m2repository" "extras;google;google_play_services"

ENV PATH=${PATH}:/android/platform-tools:/android/tools:/android/build-tools/${ANDROID_BUILD_TOOLS}/

# adb # aapt
# RUN apt-get install libc6:i386 libstdc++6:i386 zlib1g:i386