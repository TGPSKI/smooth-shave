
.PHONY: sync sync-lfs sync-lfs-objects setup serve

sync:
	./hack/clone-pull.sh
	./hack/make-llama.sh

sync-lfs:
	./hack/clone-pull-lfs-pointers.sh

sync-lfs-objects:
	./hack/clone-pull-lfs-pointers.sh
	./hack/clone-pull-lfs.sh

setup: sync	sync-lfs-objects
	
serve:
	./llama.cpp/server -m ./llama.cpp/models/airoboros-l2-13b-gpt4-m2.0.ggmlv3.q4_0.bin -ngl 32
