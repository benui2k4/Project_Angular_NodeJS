import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ProductService } from './../../../services/product.service';
import { GlobalConstants } from './../../../shared/global-constants';
import { CategoryService } from 'src/app/services/category.service';

@Component({
  selector: 'app-post-product',
  templateUrl: './post-product.component.html',
  styleUrls: ['./post-product.component.scss']
})
export class PostProductComponent implements OnInit {
  productFormPost: any = FormGroup;
  responseMessage:any;
  data: any = [];



  constructor(private formBuilder: FormBuilder, private productService: ProductService, private router: Router, private cate: CategoryService){ };
  ngOnInit(): void{
    this.postcate(),
    this.productFormPost = this.formBuilder.group({
      name: ['', [Validators.required]],
      price:['', [Validators.required]],
      code: ['',[Validators.required]],
      image:['', [Validators.required]],
      category_id:['', [Validators.required]],
      description: ['', [Validators.required]]
    })
  }

  postcate() {
    this.cate.getCategory().subscribe(
      res => {
        this.data = res
        console.log('data on ',this.data)
      }
    )

  }
  
  handleSubmit(){
    let formData = this.productFormPost.value;
    let data = {
      name: formData.name,
      price: formData.price,
      code: formData.code,
      image: formData.image,
      category_id: formData.category_id,
      description: formData.description
    }
    console.log(data);
    
    this.productService.postProduct(data).subscribe(response => {
      this.responseMessage = response?.message;
      this.router.navigate(['/product/read-product']);
    })
  }
}
