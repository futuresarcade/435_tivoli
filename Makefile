build:
	rm -rf public
	hugo

	deploy: build
		aws s3 sync public/ s3://435tivolicoralgables --acl public-read --delete
		aws configure set preview.cloudfront true
		aws cloudfront create-invalidation --distribution-id E2F9ZVAD0EPAV5 --paths '/*'
