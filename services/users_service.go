package services

import (
	domain2 "github.com/rafodelmal/go_api/domain"
	"github.com/rafodelmal/go_api/utils"
)

type userService struct{}

var (
	UserService userService
)

func (u *userService) GetUser(userId int64) (*domain2.User, *utils.ApplicationError) {
	user, err := domain2.UserDao.GetUser(userId)
	if err != nil {
		return nil, err
	}
	return user, nil
}
