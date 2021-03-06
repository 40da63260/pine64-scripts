#!/bin/bash

getDependencies(){
	sudo apt-get update
	sudo apt-get install git curl build-essential -y
}

getStuff(){
	cd	
	curl -v -o mali.tar.bz2 https://public.boxcloud.com/d/1/8mqLcX6Plj7AWy7SZ3isZXyOIcP3xyq6Eb78fZ1ODnQS_H6vugYWJ8kBdJvPTQ6kYkBVsyMdZ5BsdLXVeYZhVCabNYolKLMMaBKCj9zf-PswDZYUWuxzB5imckk-ST61oc3xPDmTA6BP-j2b-bkMPFd2OaZA84vsBnH9-4DDN3iVv2pM1DMiogFWRWON2Qhl19d-KdDtv496dLuSmrA6IpHrNCZ_OzEWgfNNo71RWwgvS6I1hbRWLLk6eEf9AiU_P4HFaFhE3kb7Fmq1qyM1lK0Hlpcf0-HGvdGWJPwFFtYYjgw3aNJ1InJtspMFp-6x00cnb2lcR_-YU1caoE-QHINQoBeIJxKPLLjhgqQqGaus-gcyn2DKvIKyPhke-LhnR2cP6hqBrdvOXDlG31hXLDf1B6p62Lt0yRyJPcBzB9lLfHRuW4VZ9lZIuI6wY74efP-SxjqxsofLUfHL7DDW9XkRYDoyWTsgAHBpjBe7uKdXIcHdMUvP_wLEacMdrLZSKc93yA31ZA1ZFZXxGmOIKgQxTMTs1pqj_IUYSF1HJU1qHykAI0crYykIfpXUZvT3VCG7ruTbJw5qQ8-e_U389H6C8_u-7_4G36o0jTGZGoogZKBprjDus-81kzKDwL8gkemlSRZ-cPBrB9rO5lVOkxwnAC-Hch4UXHjhJqX8xvgXyzblWI6iihae8G2ytf_pFbmByr-UqSwxUZZGevXVdexZZos9GJLB9XLWEmnYuYdNSN89Wsc14m4O_NlpncfDs6auRe4v0bxs91Wf1ezeUlu5F0-uifkVecwc7xNDPzmwqfEnalS6Ow97uMxCqX3XygluI9uNZeG1AZdL7DGAYtuZGETeS4KdBf1zZemMhYjRMDoS2CCtqvBmx_H030aRtM67mrrIzsmqHUqmedsh24Y5HxVFBNJI_nayb0AWAFPvgmBFnQja2SDCfIzJPGLC-QJyUtShPF-M2g0LbxRTAukAYG62O8YjUZ0zHMEPZajbKaJ8z5sAnFHnoONi8BDC9oxaQ7nzfXoDQkYkmEBQ2EkJZJ15JeuGCC3EyF9CFi431o2xRxKk098f74IbpgO7/download
	mkdir mali
	tar xvjf stuff.tar.bz2 -C ~/mali/
	cd mali/x11_pine
	mkdir x11 kernels sunxiarm sunxidrm
	tar xvjf lib_x11_r6p0.tar.bz2 -C x11
	tar xvjf r6p0_kernel_driver.tar.bz2 -C kernels
	tar xvjf sunxi_arm_video.tar.bz2 -C sunxiarm
	tar xvjf sunxi_drm_0622.tar.bz2 -C sunxidrm
}

makeStuff(){
	cd x11 
}

getDependencies
getStuff
makeStuff
