extends Upgrade


func apply_upgrade(projectile: ProjectileBase):
	projectile.state.damage += 1
