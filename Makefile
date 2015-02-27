.PHONY: deploy clean new

print = @echo "=> $(1)"\
				"\n-----------------------"

createPost = @cp "./blog/_template.md" "./blog/$(strip $(1)).md"

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
	git push origin master

	$(call print, "Go back to source")
	git checkout source

clean:
	rm -rf www

new:
ifeq ($(post),)
	@echo Qual nome do novo post? Ex: make new post=meu-novo-post
else
	$(call print, "Novo post: $(post)")
	$(call createPost, $(post))
endif
