extends Upgrade


func apply_upgrade(projectile: ProjectileBase):
	projectile.state.pierce_count += 1
