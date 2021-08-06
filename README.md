<html>
<body>

<h1>First Terraform Lab</h1>
<p>In this lab we created resource groups, created a virtual network, created subnets, attached security groups, created virtual machines, created an azure front end service with backend pooling, and more. </p>
</br>
<h3>Lab 1 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Created a resource group</li>
    <li>Created a virtual network with one subnet</li>
</ol>
</br>
<h3>Lab 2 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Deploy 2 more subnets inside of the virtual network</li>
</ol>
</br>
<h3>Lab 3 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Deployed a virtual machine</li>
    <li>Deployed network security groups</li>
    <li>Associated the network security groups to the virtual network</li>
</ol>
</br>
<h3>Lab 4 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Deployed a storage account to the resource group</li>
    <li>Deployed a container inside of the storage account</li>
</ol>
</br>
<h3>Lab 5 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Deployed Azure Front Door Service</li>
    <li>Deployed an app service in AFDS</li>
    <li>Added the app service to the backend pool</li>
</ol>
</br>
<h3>Lab 6 Overview:</h3>
<p>In this lab we:</p>
<ol>
    <li>Used packer to deploy an image</li>
</ol>
</br>
<p>Notes:<p>
<p>We used the following features of terraform to create efficient code:</p>
<ul>
    <li>Dynamic Blocks</li>
    <p>This was used to be able to loop through the module using for_each for efficient and easy to understand code</p>
    <li>Variables.tf sheet</li>
    <p>This was used to store our variables</p>
    <li>terraform.tfvars</li>
    <p>This was used to provide values for our stored variables</p>
</ul>
</body>
</html>