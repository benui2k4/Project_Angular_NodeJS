import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeRoutingModule } from './home-routing.module';
import { NoAuthComponent } from './no-auth/no-auth.component';
import { AboutComponent } from './about/auth-required.component';
import {HomeComponent} from './home.component'
import {ContactComponent} from './contact/contact.component'
import { Router } from '@angular/router';
import { NgxPaginationModule } from 'ngx-pagination';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { SerchComponent } from './serch/serch.component';
import { ShopComponent } from './shop/shop.component';

@NgModule({
  imports: [HomeRoutingModule, CommonModule,NgxPaginationModule],
  declarations: [
    NoAuthComponent,
    AboutComponent,
    HomeComponent,
    ContactComponent,
    FooterComponent,
    HeaderComponent,
    SerchComponent,
    ShopComponent,
  ],
})
export class HomeModule {
  constructor(private router: Router){ }
    logout(){
      localStorage.clear()
      
    }
}
