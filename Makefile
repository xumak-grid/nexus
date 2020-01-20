.PHONY: new-tag deploy-service deploy-pod remove

deploy-service:
	kubectl --namespace=ehernandez create -f k8s/service.yml

deploy-pod:
	kubectl --namespace=ehernandez create -f k8s/pod.yml

remove:
	kubectl --namespace=ehernandez delete -f k8s/pod.yml || true
	kubectl --namespace=ehernandez delete -f k8s/service.yml || true

new-tag:
	git tag -a "v$(VERSION)" -m "version v$(VERSION)"
	git push --tags
