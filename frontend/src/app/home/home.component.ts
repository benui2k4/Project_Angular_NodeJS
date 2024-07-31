import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ProductService } from '../services/product.service';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit{
    dataTop: any = [];
    inputValue = '';
    respeseMessenger: any;
    data: any;
    page: number = 1;
    productFormSearch: FormGroup = new FormGroup({
      name: new FormControl('')
    })

    constructor(private productService: ProductService, private userService: UserService, private  router: Router){ }
  ngOnInit(): void {
    this.productService.getProduct().subscribe((response) => {
      this.data = response
    })

    this.productService.getLimitProduct().subscribe(response => {
      console.warn('data limit product ',response)
      this.dataTop = response
    })
  }

} 

// 
