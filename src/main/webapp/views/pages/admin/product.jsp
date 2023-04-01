<div class="product-item">
    <div class="product-image-action">
        <div class="product-label"></div>
                <div class="product-image">
                       <img id="prod-img" class="img-fluid blur-up lazyload"
                            src="views/images/products/product-1-80x80.jpg"
                            style="height: 240px; object-fit: fill" alt="image"
                            title="image"/>
                </div>



        <div class="product-action">
            <ul>
                <li class="actions-quickview" data-toggle="tooltip"
                    data-placement="top" title="quick view">
                    <a class="btn open-quickview-popup">
                        <i class="icon ti-zoom-in" onclick="openQuickPopup(this.closest('.firstProduct'))"></i>
                    </a>
                </li>
                <li class="actions-quickview" data-toggle="tooltip"
                    data-placement="top" title="edit"><a
                        class="btn open-quickview-popup"><i
                        class="icon fa fa-edit" onclick="openEditPopup(this.closest('.firstProduct'))"></i></a>
                </li>
                <li class="actions-quickview" data-toggle="tooltip"
                    data-placement="top" title="delete"><a
                        class="btn open-quickview-popup"><i
                        class="icon fa fa-remove" onclick="openDeletePopup(this.closest('.firstProduct'))"></i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="product-details">
        <h3 class="product-title"></h3>
        <h4 class="product-vendor"></h4>
        <h5 class="product-price sale-price">1</h5>
    </div>
</div>

