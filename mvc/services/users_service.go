package services

import (
	"github.com/rafodelmal/go_api/mvc/domain"
	"github.com/rafodelmal/go_api/mvc/utils"
)

func GetUser(userId int64) (*domain.User, *utils.ApplicationError) {
	return domain.GetUser(userId)
}
