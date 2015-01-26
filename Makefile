.PHONY: deploy clean

print = @echo "=> $(1)"\
				"\n-----------------------"

deploy:
	make clean

	$(call print, "Compile site")
	harp compile

	$(call print, "Checkout master branch")
	git checkout master

	$(call print, "Clean unwanted files and folders")
	rm -rf www/.git www/.gitignore
	cp -r www/ ./
	make clean

	$(call print, "Commit changes to Master pages")
	git add .
	git commit -m ":rocket: deploy website"
	git push origin gh-pages

	$(call print, "Go back to source")
	git checkout source

clean:
	rm -rf www
