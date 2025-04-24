package com.blautech.ProductService.service;

import com.blautech.ProductService.model.Producto;
import java.util.List;
import java.util.Optional;

public interface ProductoService {

    List<Producto> obtenerTodos();

    Optional<Producto> obtenerPorId(Integer id);

    Producto crearProducto(Producto producto);

    Producto actualizarProducto(Integer id, Producto productoDetalle);

    void borrarProducto(Integer id);
}
