class Dependencia {
	var flota = []	
	var property cantidadDeEmpleados
	
	method agregarAFlota(vehiculo) { flota.add(vehiculo) }
	method quitarDeFlota(vehiculo) { flota.remove(vehiculo) }
	
	
	method pesoTotalFlota() { return flota.sum({ c => c.peso() }) }
	

	method estaBienEquipada() { 
		return flota.size() >= 3 and flota.all({ c => c.velocidadMaxima() >= 100 })
	}

	method capacidadTotalEnColor(color) {
		return flota.filter({ c => c.color() == color }).sum({ c => c.capacidad() })
	}

	method capacidadTotalEnColor_variante(color) {
		return self.vehiculosDeColor(color).sum({ c => c.capacidad() })
	}
	method vehiculosDeColor(color) {
		return flota.filter({ c => c.color() == color })
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max({ c => c.velocidadMaxima() }).color()
	}
	
	
	method capacidadFaltante() {
		return cantidadDeEmpleados - self.capacidadFlota()
	}
	method capacidadFlota() { 
		return flota.sum({ c => c.capacidad() })
	}
	
	
	method esGrande() {
		return cantidadDeEmpleados >= 40 and flota.size() >= 5
	}
}
