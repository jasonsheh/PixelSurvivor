extends Upgrade


func apply_upgrade(projectile: ProjectileBase):
	projectile.state.number += 1
