default: deploy

deploy:
	rm -rf ./_site
	bundle exec jekyll build
	git add .
	git commit -m "rebuild of ./_site dir for release"
	git push heroku master
