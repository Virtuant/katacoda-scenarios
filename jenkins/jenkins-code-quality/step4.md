### Verify Jenkins Results

Since we have improved the source code, we expect the Jenkins Checkstyle warnings to decrease. We can verify this by doing the following:

-> save, commit and push the improved code -> log into Jenkins -> check out the build process that is triggered by the code push (or we can manually trigger the build process by clicking project -> Build now)

On the dashboard, we will see, that the Checkstyle statistics have (very) slightly improved:

2017-01-18-04_37_06-github-triggered-build-jenkins-v2

On the upper right edge of the figure, the number of warnings is slightly lower. The code quality is far from being perfect, but we now have all tools and plugins needed to improve the situation.

After changing all tabs by 4 spaces each, the number of Checkstyle violations goes down by ~50%. That is a good start.

2017-01-19-22_51_58-github-triggered-build-jenkins-v2

Perfect, we have learned how to use the Checkstyle plugin for Eclipse in order to produce better code. And the Jenkins Checkstyle plugin allows us to admire the progress we make.


![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38051154-7241f828-329b-11e8-9732-48d15d74027d.png)
![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38052765-4d579b76-32a0-11e8-862d-3247a79eeb93.png)
![2016-12-28-15_39_37-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052766-4d713ffe-32a0-11e8-9fa0-e8fc8a7cc0f1.png)
![2016-12-28-15_40_08-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052767-4d90bec4-32a0-11e8-90cf-ac54e32867e9.png)

![2016-12-28-23_05_10-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052775-4e0d2248-32a0-11e8-910c-ab96a3bcb37b.png)
![2016-12-28-23_06_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052776-4e48f4e4-32a0-11e8-9d68-f90e9a3d2a3b.png)

![2016-12-29-09_16_30-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052783-4f058c6c-32a0-11e8-9e08-5bf9a1d7890c.png)

![2017-01-18-02_54_03](https://user-images.githubusercontent.com/558905/38052817-51fd73bc-32a0-11e8-842c-c317e1a66fb9.png)


![2017-01-18-04_37_06-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052822-52471652-32a0-11e8-8549-09ce7d8d180c.png)
![2017-01-19-22_51_58-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052823-5257790c-32a0-11e8-9b31-66d6789fb136.png)
