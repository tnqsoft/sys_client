<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * UserController.
 *
 * @Route("/api/user", name="api_user.")
 */
class UserController extends AbstractController
{
    /**
     * Matches /user/info exactly
     *
     * @Route("/info", name="info")
     */
    public function userInfo()
    {
        $user = $this->getUser();
        $data = [
            'id' => $user->getId(),
            'username' => $user->getUsername(),
            'email' => $user->getEmail(),
        ];
        return new JsonResponse($data, JsonResponse::HTTP_OK);
    }
}