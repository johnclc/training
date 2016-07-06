

#


# DO NOT DELETE THESE LINES!


#


# Your DNSimple email is:


#

#     sethvargo+terraform@gmail.com


#


# Your DNSimple token is

# 


#     sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF


#


# Your Identity is:


#


#     totaljobs-a87ff679a2f3e71d9181a67b7542122c


#

provider "dnsimple" {
	token = "sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF"
	email = "sethvargo+terraform@gmail.com"
}

resource "dnsimple_record" "example" {
	domain = "terraform.rocks"
	type = "A"
	name = "johnche"
	value = "${aws_instance.web.0.public_ip}"
}
