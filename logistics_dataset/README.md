Logistics is an important aspect of any business. Understanding the operational flow, product quality and delivery behaviour helps organisations make imformed decisions and improve customer sastisfaction.

This dataset provides an opportunity to explore real-world logistics questions and analyse operational patterns using data.

## Dataset Schema

### customers
| customer_id (PK) | customer_name | region | signup_date |

### products
| product_id (PK) | product_name | category | price |

### orders
| order_id (PK) | customer_id (FK) | order_date | promised_date | delivery_date | shipping_cost | discount |

### order_items
| order_item (PK) | order_id (FK) | product_id (FK) | quantity |

### payments
| payment_id (PK)  | order_id (FK) | payment_date | payment_method | amount |

### shipments
| shipment_id (PK) | order_id (FK) | dispatch_date | delivery_status |

### returns
| return_id (PK) | order_id (FK) | product_id (FK) | return_date | return_reason |


