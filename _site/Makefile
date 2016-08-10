default: deploy

deploy:
	rm -rf ./_site
	jekyll build
	git add ./_site
	git commit -m "rebuild of ./_site dir for release"
	git push heroku master
