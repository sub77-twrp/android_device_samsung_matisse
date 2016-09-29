## TWRP device tree for Galaxy Tab 4 

Add to `.repo/local_manifests/matisse.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<project path="device/samsung/matisse" name="android_device_samsung_matisse" remote="TeamWin" revision="android-6.0" />
</manifest>
```

Then run `repo sync` to check it out.

Kernel sources are available at: https://git.sphere.ly/twrp/android_kernel_samsung_matisse/tree/twrp-6.0

