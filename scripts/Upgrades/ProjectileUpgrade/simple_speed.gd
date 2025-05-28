extends Upgrade


func apply_upgrade(projectile: ProjectileBase):
	# print("upgrade projectile")
	projectile.state.speed += 200
