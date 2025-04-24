import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-base-layout',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  template: `
    <header class="bg-primary text-white p-3">
      <div class="container">
        <h1>Mi Aplicación</h1>
      </div>
    </header>

    <main class="container my-5">
      <router-outlet></router-outlet>
    </main>

    <footer class="bg-dark text-white text-center p-3">
      <div class="container">
        © 2023 Mi Empresa
      </div>
    </footer>
  `,
  styles: [`
    header, footer {
      width: 100%;
    }
    main {
      min-height: 60vh;
    }
  `]
})
export class BaseLayoutComponent {}
