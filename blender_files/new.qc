$modelname "wormonlooker\belly.mdl"

$model "Belly" "Collection.dmx"

$surfaceprop "default"
$contents "solid"

$illumposition 0 0 0

$mostlyopaque
$cdmaterials "models\wormonlooker\belly\"

$sequence "idle" {
	"anims\BellySkeleton.dmx"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$jigglebone "main1"
{
	is_flexible
	{
		length 32
		tip_mass 1024
		pitch_stiffness 256
		pitch_damping 16
		yaw_stiffness 256
		yaw_damping 16
		along_stiffness 256
		along_damping 16
		angle_constraint 15
	}
}