package services

import (
	domain2 "github.com/rafodelmal/go_api/domain"
	"github.com/rafodelmal/go_api/utils"
	"github.com/stretchr/testify/assert"
	"net/http"
	"testing"
)

var (
	userDaoMock     usersDaoMock
	getUserFunction func(userId int64) (*domain2.User, *utils.ApplicationError)
)

type usersDaoMock struct{}

func (m *usersDaoMock) GetUser(userId int64) (*domain2.User, *utils.ApplicationError) {
	return getUserFunction(userId)
}

func init() {
	domain2.UserDao = &usersDaoMock{}
}

func TestGetUserNotFoundInDatabase(t *testing.T) {
	getUserFunction = func(userId int64) (*domain2.User, *utils.ApplicationError) {
		return nil, &utils.ApplicationError{
			StatusCode: http.StatusNotFound,
			Message:    "user 0 was not found",
		}
	}
	user, err := UserService.GetUser(0)
	assert.Nil(t, user)
	assert.NotNil(t, err)
	assert.EqualValues(t, http.StatusNotFound, err.StatusCode)
	assert.EqualValues(t, "user 0 was not found", err.Message)
}

func TestGetUserNoError(t *testing.T) {
	getUserFunction = func(userId int64) (*domain2.User, *utils.ApplicationError) {
		return &domain2.User{
			Id: 123,
		}, nil
	}
	user, err := UserService.GetUser(0)
	assert.Nil(t, err)
	assert.NotNil(t, user)
	assert.EqualValues(t, 123, user.Id)
}
