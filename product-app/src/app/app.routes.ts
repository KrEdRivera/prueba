// src/app/app.routes.ts
import { Routes } from '@angular/router';
import { BaseLayoutComponent } from './layouts/layout/base-layout/base-layout.component';
import { ProductosComponent } from './modules/pages/productos/productos.component';

export const routes: Routes = [
  {
    path: '',
    component: BaseLayoutComponent,
    children: [
      {
        path: '',
        component: ProductosComponent
      },
    ]
  },
  { path: '**', redirectTo: '' }
];
