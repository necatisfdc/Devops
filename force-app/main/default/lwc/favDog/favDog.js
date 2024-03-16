import { LightningElement, wire } from 'lwc';
import getBreedList from '@salesforce/apex/DogApi.getAllBreedList';
import getSubBreedListFromAPI from '@salesforce/apex/DogApi.getAllSubBreed';
import getBreedImagesFromAPI from '@salesforce/apex/DogApi.getAllBreedImages';

export default class FavDog extends LightningElement {

    selectedBreed;
    selectedSubBreed;
    isBreedImagesExist = false;

    subBreeds = [];
    dogImagesArray = [];
    favoritesDogs = []
    allBreedList;

    address = {
        city: 'ny',
        zip: 90111
    }

    @wire(getBreedList)
    getBreedListWire({ error, data }) {
        if (data) {
            this.allBreedList = [];
            for (const [key, value] of Object.entries(JSON.parse(data))) {
                console.log(`${key}: ${value}`);
                this.allBreedList.push({ label: key.toUpperCase(), value: key });
            }
        }
        else {
            console.log('error', data);
        }
    };

    handleBreedChange(event) {
        this.selectedSubBreed = undefined;
        this.selectedBreed = event.detail.value;
        console.log('........handling Breed chnage .... ');
        console.log('Selected Breed: ' + this.selectedBreed);
        getSubBreedListFromAPI({ breed: this.selectedBreed })
            .then(subBreedsNew => {
                this.subBreeds = [];
                JSON.parse(subBreedsNew).message.forEach(subBreed => {
                    this.subBreeds.push({ label: subBreed.toUpperCase(), value: subBreed });
                });

            })
            .catch(error => {
                console.log(error);
            })

    }

    handleSubBreedChange(event) {
        this.selectedSubBreed = event.detail.value;

    }

    get isSubBreedExist() {
        return !(this.subBreeds === undefined || this.subBreeds.length == 0);
    }

    getBreedImages() {
        this.isBreedImagesExist = false;
        this.dogImagesArray = [];

        getBreedImagesFromAPI({ breed: this.selectedBreed })
            .then(images => {
                if (this.selectedSubBreed) {
                    JSON.parse(images).message
                        .filter(imageLink => imageLink.includes(this.selectedSubBreed))
                        .forEach(imageLink => {
                            this.dogImagesArray.push({ 'breed': this.selectedBreed.toUpperCase() + ' - ' + this.selectedSubBreed.toUpperCase(), 'link': imageLink });
                        });
                }
                else {
                    JSON.parse(images).message
                        .forEach(imageLink => {

                            this.dogImagesArray.push({ 'breed': this.selectedBreed.toUpperCase(), 'link': imageLink });
                        });;

                }
                this.isBreedImagesExist = !(this.dogImagesArray.length == 0);

            })
            .catch(error => {
                console.log(error);
            })
    }

    
    addToFavorites(event){
/*
        <div data-id={task.taskId} class="draggable" draggable="true" key={task.taskId} 
        ondragstart={handleDragStart}>{task.name}</div>
        var taskId = event.target.dataset.id;
*/
        console.log(event.target.value);
        this.favoritesDogs.push(event.target.value);
    }

    trackhandler(event){
        this.address = {...this.address, "city":event.target.value}
    }
    //do
}