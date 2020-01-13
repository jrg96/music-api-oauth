package com.empresa.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.empresa.api.entity.Album;
import com.empresa.api.service.IAlbumService;

@RestController
@RequestMapping("/api")
public class AlbumController 
{
	@Autowired
	private IAlbumService albumService;
	
	@GetMapping("/albums")
	public List<Album> buscarTodas()
	{
		return this.albumService.buscarTodas();
	}
	
	@PostMapping("/save")
	public Album guardarAlbum(@RequestBody Album album)
	{
		this.albumService.guardar(album);
		return album;
	}
}
