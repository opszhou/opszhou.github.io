<style>
.wsdx {
    text-align: center;
    height: 12px;
    line-height: 12px;
    color: #ccc;
    font-size: 12px;
}

.dx {
    display: inline-block;
    width: 20%;
    border-top: 1px solid #ccc;
    vertical-align: 5px;
}
</style>

<div class="wsdx"> 
{% if not is_index %}
     <span class="dx"></span>
         <span class="text">The  End</span>
     <span class="dx"></span> 
{% endif %}
</div>