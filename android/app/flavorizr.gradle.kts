import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor")

    productFlavors {
        create("stage") {
            dimension = "flavor"
            applicationId = "dev.mhmz.lensfolio.stage"
            resValue(type = "string", name = "app_name", value = "Lens-Stage")
        }
        create("qa") {
            dimension = "flavor"
            applicationId = "dev.mhmz.lensfolio.qa"
            resValue(type = "string", name = "app_name", value = "Lens-QA")
        }
        create("prod") {
            dimension = "flavor"
            applicationId = "dev.mhmz.lensfolio"
            resValue(type = "string", name = "app_name", value = "Lensfolio")
        }
    }
}