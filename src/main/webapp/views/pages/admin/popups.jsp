<!-- Start Scroll Top -->
<div id="scrollTop"><i class="ti-arrow-up"></i></div>
<!-- End Scroll Top -->

<!-- Start Product Quick View Popup -->
<div id="open-quickview-popup" class="quickview-popup modal">
    <div class="quickview-content modal-content">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-6">
                <div class="product-single-photo slider thumbnails-single">
                    <div class="single-item"><img id="productImg" class="img-fluid blur-up lazyload"
                                                  src=""
                                                  title="image"/></div>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-6">
                <div class="product-info">
                    <h3 class="product-title">Quick View Popup Product</h3>
                    <div class="pro-revi-arrow clearfix">
                        <div class="pro-arrow pull-right">
                            <a class="pro-prev" onclick="prevProduct()"><i class="ti-angle-left"></i></a>
                            <a class="pro-next" onclick="nextProduct()"><i
                                    class="ti-angle-right"></i></a>
                        </div>
                    </div>
                    <ul class="row pro-info-list">
                        <li class="col-12 col-md-4 col-sm-4 brand text-sm-left"><b>Brand: </b> <b id="brand"></b></li>
                        <li class="col-12 col-md-4 col-sm-4 vendor text-sm-center"><b>Vendor: </b> <b id="vendor"></b>
                        </li>
                        <li class="col-12 col-md-4 col-sm-4 sku text-sm-right"><b>SKU: </b> <b id="sku"></b></li>
                    </ul>
                </div>
                <br>
                <ul class="d-sm-flex flex-sm-row align-items-sm-center product-price-info">
                    <li class="product-price m-0"><span id="sale-price" class="sale-price"></span></li>
                </ul>
                <ul class="d-flex flex-column pro-details">
                    <li class="fa fa-check product-details-in-popup mr-2" aria-hidden="true"><b>Quantity: </b> <b
                            id="quantity"></b></li>
                    <br>
                    <li class="fa fa-check  product-details-in-popup mr-2" aria-hidden="true"><b>Category: </b><b
                            id="category"></b></li>
                    <br>
                    <li class="fa fa-check product-details-in-popup mr-2" aria-hidden="true"><b>Made in: </b><b
                            id="made-in"></b></li>
                    <br>
                    <li class="fa fa-check  product-details-in-popup mr-2" aria-hidden="true"><b>Description: </b> <b
                            id="description"></b></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End Product Quick View Popup -->


<!-- Start Product Edit Popup -->
<div id="open-edit-popup" class="quickview-popup modal">
    <div class="modal-content">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-6">
                <form id="editForm" class="container-form" ENCTYPE="MULTIPART/FORM-DATA">
                    <div class="inputs-div" style="width: 100%">
                        <label for="prodName">Product Name</label>
                        <input style="background-color: white;" class="form-control" id="prodName" type="text"
                               name="name"/>
                        <label for="prodQuantity">Product Quantity</label>
                        <input style="background-color: white;" class="form-control" type="text"
                               onblur="isQuantityValidNumber(this.value)"
                               name="quantity" id="prodQuantity"/>
                        <label id="quantityError" style="color:red">Enter Valid Number</label>
                        <label for="prodCategory">Product Category</label>
                        <select name="categoryId" id="prodCategory"
                                style="display: block; width: 100%; border: 1px solid #ccc; border-radius: 4px; padding: 6px 12px; font-size: 16px; color: #333; background-color: #fff;">
                            <option value="oil">Oil</option>
                            <option value="liquid">Liquid</option>
                            <option value="tire">Tire</option>
                            <option value="plug">Plug</option>
                            <option value="battery">Battery</option>
                        </select>
                        <label for="prodVendor" style="margin-top: 5px">Product Vendor</label>
                        <input style="background-color: white;" class="form-control" type="text" name="vendor"
                               id="prodVendor"/>
                        <label for="prodBrand">Product Brand</label>
                        <input style="background-color: white;" type="text" class="form-control" name="brand"
                               id="prodBrand"/>
                        <label for="prodMadeIn">Made in</label>
                        <input style="background-color: white;" type="text" class="form-control" name="madeIn"
                               id="prodMadeIn"/>
                        <label for="prodSku" id="sku-label">Product SKU</label>
                        <input style="background-color: white;" type="text" class="form-control" name="sku"
                               id="prodSku"/>
                        <label for="prodDescription">Product Description</label>
                        <textArea style="background-color: white;" rows="4" cols="20" class="form-control"
                                  name="description"
                                  id="prodDescription"></textArea>
                        <label for="prodPrice">Product Price</label>
                        <input style="background-color: white;" type="text" class="form-control"
                               onblur="isPriceValidNumber(this.value)" name="price"
                               id="prodPrice"/>
                        <label id="priceError" style="color:red">Enter Valid Number</label>
                        <input style="background-color: white;" type="file" accept="image/*" multiple
                               id="edit-product-image-chooser" name="imageName">
                        <input type="button" id="editBtn" value="Submit" class="form__submit" style="margin-top: 8px"
                               onclick="editProduct()">
                    </div>
                </form>

            </div>

            <div class="col-12 col-sm-12 col-md-6">
                <div class="product-single-photo slider thumbnails-single"
                     style="width: 100%;height: 600px;border-radius: 6px;">
                    <div id="edit-image-div" style="max-height: 400px; overflow: auto; border: 0" class="single-item">
                        <img style="display:none; width:200px; height:200px;  margin-right:3px" id="edit-product-image"
                             class="img-fluid blur-up lazyload"
                             src="#"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Product Edit Popup -->


<!-- START Product ADD Popup -->
<div id="open-add-popup" class="quickview-popup modal">
    <div class="modal-content">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-6">
                <div class="pagewrap">
                    <form class="container-form" id="addForm" ENCTYPE="MULTIPART/FORM-DATA" style="overflow-y: auto">
                        <label id="product-name-label" for="product-name">product name</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-name"
                               onblur="validateName(this.value)"
                               name="name" value="" required>
                        <label id="nameErr" style="color: red;" class="err">Required Field</label>

                        <label for="product-Category">Product Category</label>
                        <select name="categoryId" class="form-control" id="product-Category"
                                style="display: block; width: 100%; border: 1px solid #ccc; border-radius: 4px; padding: 6px 12px; font-size: 16px; color: #333; background-color: #fff;">
                            <option value="oil">Oil</option>
                            <option value="liquid">Liquid</option>
                            <option value="tire">Tire</option>
                            <option value="plug">Plug</option>
                            <option value="battery">Battery</option>
                        </select>

                        <label id="product-price-label" for="product-price">price</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-price"
                               onblur="validatePrice(this.value)"
                               name="price" value="" required>
                        <label id="price-Err" style="color: red;"></label>

                        <label id="product-quantity-label" for="product-quantity">quantity</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-quantity"
                               onblur="validateQuantity(this.value)" name="quantity" value="" required>
                        <label id="quantity-Err" style="color: red;"></label>

                <label id="product-name-label" for="product-name" >product name</label>
                <input class="form-control" type="text" id="product-name" onblur="validateName(this.value)" name="name" value="" required>
                <label id="nameErr" style="color: red;" class="err" >Required Field</label>

                        <label id="product-brand-label" for="product-brand">brand</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-brand"
                               onblur="validateBrand(this.value)"
                               name="brand" value="" required>
                        <label id="brandErr" style="color: red;" class="err">Required Field</label>


                        <label id="product-madeIn-label" for="product-madeIn">made in</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-madeIn"
                               onblur="validateMadeIn(this.value)"
                               name="madeIn" value="" required>
                        <label id="madeInErr" style="color: red;" class="err">Required Field</label>

                        <label id="product-vendor-label" for="product-vendor">vendor</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-vendor"
                               onblur="validateVendor(this.value)"
                               name="vendor" value="" required>
                        <label id="vendorErr" class="err" style="color: red;">Required Field</label>

                        <label id="product-sku-label" for="product-sku">SKU</label>
                        <input style="background-color: white;" class="form-control" type="text" id="product-sku"
                               onblur="verifySku(this.value)"
                               name="sku" value="" required>
                        <label id="sku-Err" style="color: red;"></label>


                        <label id="product-description-label" for="product-description">description</label>
                        <textArea class="form-control" rows="4" cols="40" style="height: 40px" id="product-description" name="description"
                                  required></textArea>

                        <input style="background-color: white; height: 40px" type="file" accept="image/*" multiple
                               class="form-control" name="imageName"
                               id="add-product-image-chooser">
                        <label id="imageErr" class="err" style="color: red;">Required Field</label>


                        <input class="form__submit" id="addProduct" type="button" onclick="insertProduct(event)"
                               value="submit">
                    </form>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-6">
                <div class="product-single-photo slider thumbnails-single"
                     style="width: 100%;height: 600px;border-radius: 6px;">
                    <div id="add-image-div" style="max-height: 400px; overflow: auto; border: 0" class="single-item">
                        <img style="display:none; width:200px; height:200px;  margin-right:3px" id="add-product-image"
                             class="img-fluid blur-up lazyload" src="#"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END Product ADD Popup -->
