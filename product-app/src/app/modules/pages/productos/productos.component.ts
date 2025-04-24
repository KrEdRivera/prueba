import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Producto } from '../../../core/models/producto.model';
import { ProductoService } from '../../../core/services/producto/producto.service';

@Component({
  selector: 'app-productos',
  standalone: true,
  imports: [CommonModule, FormsModule ],
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {
  productos: Producto[] = [];
  productoActual: Producto = {
    nombre: '',
    precio: 0,
    descripcion: '',
    stock: 0
  };

  productoEditado: Producto | null = null;
  modoEdicion: boolean = false;

  constructor(private productoService: ProductoService) { }

  ngOnInit(): void {
    this.obtenerProductos();
  }

  obtenerProductos(): void {
    this.productoService.getProductos().subscribe({
      next: (data: Producto[]) => this.productos = data,
      error: (err) => console.error('Error al obtener los productos', err)
    });
  }

  guardarProducto(): void {
    if (this.modoEdicion) {
      // Actualizar producto
      if (this.productoActual.id) {
        this.productoService.actualizarProducto(this.productoActual.id, this.productoActual).subscribe({
          next: (productoActualizado: Producto) => {
            const index = this.productos.findIndex(p => p.id === productoActualizado.id);
            if (index !== -1) {
              this.productos[index] = productoActualizado;
            }
            this.cancelarEdicion();
          },
          error: (err) => console.error('Error al actualizar el producto', err)
        });
      }
    } else {
      // Crear producto nuevo
      this.productoService.crearProducto(this.productoActual).subscribe({
        next: (productoCreado: Producto) => {
          this.productos.push(productoCreado);
          this.resetFormulario();
        },
        error: (err) => console.error('Error al crear el producto', err)
      });
    }
  }

  eliminarProducto(id: number): void {
    this.productoService.eliminarProducto(id).subscribe({
      next: () => {
        this.productos = this.productos.filter(p => p.id !== id);
      },
      error: (err) => console.error('Error al eliminar el producto', err)
    });
  }

  iniciarEdicion(producto: Producto): void {
    this.modoEdicion = true;
    // Hacemos una copia para evitar modificar directamente la lista
    this.productoActual = { ...producto };
  }

  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.resetFormulario();
  }

  resetFormulario(): void {
    // Se puede reiniciar a un objeto vacío para crear
    this.productoActual = {
      nombre: '',
      precio: 0,
      descripcion: '',
      stock: 0
    };
  }

}
