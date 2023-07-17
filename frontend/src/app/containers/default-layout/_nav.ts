import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  {
    name: 'Dashboard',
    url: '/dashboard',
    iconComponent: { name: 'cilHome' },
    badge: {
      color: 'info',
      text: 'NEW'
    }
  },
  {
    title: true,
    name: 'Admin'
  },

  {
    name: 'Account Admin',
    url: '/admin',
    iconComponent: { name: 'cilPuzzle' },
    children: [
      {
        name: 'Read Admin',
        url: '/admin/read-admin'
      },
      {
        name: 'Post Admin',
        url: '/admin/post-admin'
      },
      {
        name: 'Update Admin',
        url: '/admin/update-admin'
      },
    ]
  },
  {
    name: 'Category',
    url: '/category',
    iconComponent: { name: 'cilPuzzle' },
    children: [
      {
        name: 'Read Category',
        url: '/category/read-category'
      },
      {
        name: 'Post Category',
        url: '/category/post-category'
      },
      {
        name: 'Update Category',
        url: '/category/update-category'
      },
    ]
  },
  {
    name: 'Product',
    url: '/product',
    iconComponent: { name: 'cilPuzzle' },
    children: [
      {
        name: 'Read Product',
        url: '/product/read-product'
      },
      {
        name: 'Post Product',
        url: '/product/post-product'
      },
      {
        name: 'Update Product',
        url: '/product/update-product'
      },
    ]
  },
  {
    name: 'Customer',
    url: '/customer',
    iconComponent: { name: 'cilPuzzle' },
    children: [
      {
        name: 'Read Customer',
        url: '/customer/read-customer'
      },
      {
        name: 'Post Customer',
        url: '/customer/post-customer'
      },
      {
        name: 'Update Customer',
        url: '/customer/update-customer'
      },
    ]
  },
];
