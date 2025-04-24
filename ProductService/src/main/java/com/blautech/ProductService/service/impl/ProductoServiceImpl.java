package com.blautech.ProductService.service.impl;

import com.blautech.ProductService.model.Producto;
import com.blautech.ProductService.repository.ProductoRepository;
import com.blautech.ProductService.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoRepository productoRepository;

    @Autowired
    public ProductoServiceImpl(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    public List<Producto> obtenerTodos() {
        return productoRepository.findAll();
    }

    @Override
    public Optional<Producto> obtenerPorId(Integer id) {
        return productoRepository.findById(id);
    }

    @Override
    public Producto crearProducto(Producto producto) {
        // Si no se asigna la fecha en el controlador, se puede asignar aquí.
        if (producto.getFechaCreacion() == null) {
            producto.setFechaCreacion(java.time.LocalDateTime.now());
        }
        return productoRepository.save(producto);
    }

    @Override
    public Producto actualizarProducto(Integer id, Producto productoDetalle) {
        Producto producto = productoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Producto no encontrado con id: " + id));
        producto.setNombre(productoDetalle.getNombre());
        producto.setPrecio(productoDetalle.getPrecio());
        producto.setDescripcion(productoDetalle.getDescripcion());
        producto.setStock(productoDetalle.getStock());
        // Si se requiere actualizar otros campos, se puede hacer aquí.
        return productoRepository.save(producto);
    }

    @Override
    public void borrarProducto(Integer id) {
        productoRepository.deleteById(id);
    }
}
