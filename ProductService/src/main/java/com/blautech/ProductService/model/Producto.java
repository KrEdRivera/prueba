package com.blautech.ProductService.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "productos")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Producto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "nombre", length = 100, nullable = false)
	private String nombre;
	
	@Column(name = "precio", nullable = false, precision = 10, scale = 2)
	private BigDecimal precio;
	
	@Column(name = "descripcion", columnDefinition = "text")
	private String descripcion;
	
	@Column(name = "stock")
	private Integer stock = 0;
	
	@Column(name = "fecha_creacion", columnDefinition = "timestamp without time zone")
	private LocalDateTime fechaCreacion;
	
	// Constructor personalizado (sin id y fechaCreacion) para facilitar la creación de nuevos productos
	public Producto(String nombre, BigDecimal precio, String descripcion, Integer stock) {
	    this.nombre = nombre;
	    this.precio = precio;
	    this.descripcion = descripcion;
	    this.stock = stock;
	    this.fechaCreacion = LocalDateTime.now();
	}
	
}
