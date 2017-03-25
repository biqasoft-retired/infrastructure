FROM biqasoft/teamcity-agent-base

# based on https://github.com/JetBrains/teamcity-docker-minimal-agent

ENV ANDROID_COMPILE_SDK=25

# https://developer.android.com/studio/releases/build-tools.html
ENV ANDROID_BUILD_TOOLS=25.0.2

# https://developer.android.com/studio/releases/sdk-tools.html
ENV ANDROID_SDK_TOOLS=25.2.5

ENV ANDROID_HOME=/android
# download android sdk
# install all sdk packages
RUN mkdir /android && cd android && apt-get update && apt-get install -y wget tar unzip lib32stdc++6 lib32z1 && \
	wget https://dl.google.com/android/repository/tools_r${ANDROID_BUILD_TOOLS}-linux.zip && \
	unzip tools_r${ANDROID_BUILD_TOOLS}-linux.zip && rm tools_r${ANDROID_BUILD_TOOLS}-linux.zip && \ 
	cd tools && \ 
	echo "y" | ./android update sdk --no-ui --all --filter platform,platform-tools, build-tools-${ANDROID_BUILD_TOOLS},android-25,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services

ENV PATH=${PATH}:/android/platform-tools:/android/tools:/android/build-tools/${ANDROID_BUILD_TOOLS}/

# adb # aapt
# RUN apt-get install libc6:i386 libstdc++6:i386 zlib1g:i386