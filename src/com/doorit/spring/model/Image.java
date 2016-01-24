package com.doorit.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


	
	@Entity
	@Table(name="IMAGE")
	public class Image implements Serializable {
		
	 public Image() {
			
		}
			
		
		private static final long serialVersionUID = 1L;
		
		@Id
		@Column(name="image_id")
		@GenericGenerator(name="gen",strategy="increment")
		@GeneratedValue(generator="gen")
		
		private long imageId;
		
		public long getImageId() {
			return imageId;
		}

		public void setImageId(long imageId) {
			this.imageId = imageId;
		}

		
		@Lob
		@Column(name="image" )
		private byte[] image;

		public byte[] getImage() {
			return image;
		}

		public void setImage(byte[] image) {
			this.image = image;
		}

		private String imageName;

		public String getImageName() {
			return imageName;
		}

		public void setImageName(String imageName) {
			this.imageName = imageName;
		}

}
