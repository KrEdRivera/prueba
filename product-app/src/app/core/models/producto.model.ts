export interface Producto {
  id?: number; // opcional ya que se asigna en la base de datos
  nombre: string;
  precio: number;
  descripcion?: string;
  stock?: number;
  fecha_creacion?: Date;
}
